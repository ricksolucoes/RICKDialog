program RICKDialog;

uses
  System.StartUpCopy,
  FMX.Forms,
  RICK.Dialog.Interfaces in 'src\RICK.Dialog.Interfaces.pas',
  RICK.Dialog in 'src\RICK.Dialog.pas',
  RICK.Dialog.Events in 'src\RICK.Dialog.Events.pas',
  RICK.Dialog.Enums in 'src\RICK.Dialog.Enums.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Run;
end.
