{$APPTYPE CONSOLE}
program msgremove;

uses
  SysUtils,
  {$ifdef mswindows}
  gnugettext in '..\..\sample\gnugettext.pas',
  poparser in '..\..\dxgettext\poparser.pas',
  appconsts in '..\..\dxgettext\appconsts.pas',
  consoleoutput in '..\..\dxgettext\consoleoutput.pas',
  {$else}
  gnugettext in '../../sample/gnugettext.pas',
  poparser in '../../dxgettext/poparser.pas',
  appconsts in '../../dxgettext/appconsts.pas',
  consoleoutput in '../../dxgettext/consoleoutput.pas',
  {$endif}
  consoleapp in 'consoleapp.pas',
  msgremoveengine in 'msgremoveengine.pas';

var
  conapp:TConsoleApp;
begin
  try
    textdomain('dxgettext');
    AddDomainForResourceString('delphi');
    AddDomainForResourceString('kylix');
    conapp:=TConsoleApp.Create;
    try
      conapp.Execute;
    finally
      FreeAndNil (conapp);
    end;
  except
    on e:Exception do begin
      writeln (e.Message);
      ExitCode:=1;
    end;
  end;
end.
