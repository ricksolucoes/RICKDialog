program RICKDialog.Demo;

uses
  System.StartUpCopy,
  FMX.Forms,
  RICK.Dialog.Demo.View.Main in 'RICK.Dialog.Demo.View.Main.pas' {frmDemo};

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown:= True;
{$ENDIF}
  Application.Initialize;
  Application.CreateForm(TfrmDemo, frmDemo);
  Application.Run;
end.
