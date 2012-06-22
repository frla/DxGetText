unit consoleapp;

interface

uses
  msgremoveengine;
  
type
  TConsoleApp=
    class
    private
      engine:Tmsgmkignoreengine;
    public
      constructor Create;
      destructor Destroy; override;
      procedure AnalyzeCommandline;
      procedure Execute;
      procedure WriteHelp;
    end;



implementation

uses
  SysUtils,
  gnugettext,
  appconsts,
  consoleoutput;

{ TConsoleApp }

procedure TConsoleApp.AnalyzeCommandline;
var
  i:integer;
  param,uparam:string;
begin
  i:=1;
  while i<=paramcount do begin
    param:=paramstr(i);
    uparam:=uppercase(param);
    if uparam='-O' then begin
      inc (i);
      engine.outputfilename:=ExpandFileName(paramstr(i));
    end else 
    if uparam='-I' then begin
      inc (i);
      engine.removelistfilename:=ExpandFileName(paramstr(i));
    end else begin
      engine.inputfilename:=ExpandFileName(param);
    end;
    inc (i);
  end;
end;

constructor TConsoleApp.Create;
begin
  engine:=Tmsgmkignoreengine.Create;
end;

destructor TConsoleApp.Destroy;
begin
  FreeAndNil (engine);
  inherited;
end;

procedure TConsoleApp.Execute;
begin
  if (paramcount=0) or ((paramcount=1) and (uppercase(paramstr(1))='--HELP')) then
    WriteHelp
  else begin
    AnalyzeCommandline;
    engine.Execute;
  end;
end;

procedure TConsoleApp.WriteHelp;
begin
  writeln (Format(_('msgremove %s'),(.version.)));
  writeln;
  writeln (_('msgremove usage:'));
  writeln (  '  msgremove default.po -i ignore.po -o output.po');
  writeln;
  writeln (_('This will generate the file output.po as a copy of default.po, '+sLineBreak+
             'but without all the MsgIds that are listed in ignore.po.'));
end;

end.
