unit msgmergedxengine;

interface

type
  TMsgMergeDxEngine=
    class
    public
      translationfilename,
      templatefilename:string;
      outputfilename:string;
      procedure Execute;
    end;

implementation

uses
  sysutils, classes, poparser, consoleoutput, gnugettext;

{ TMsgImportEngine }

procedure TMsgMergeDxEngine.Execute;
var
  translist:TPoEntryList;
  pe,petr:TPoEntry;
  parser:TPoParser;
  tf:TextFile;
  fs:TFileStream;
begin
  translist:=TPoEntryList.Create;
  try
    translist.LoadFromFile(translationfilename);
    FileMode:=fmOpenRead;
    AssignFile (tf,templatefilename);
    Reset (tf);
    try
      parser:=TPoParser.Create;
      try
        fs:=TFileStream.Create (outputfilename,fmCreate);
        try
          while true do begin
            pe:=parser.ReadNextEntry(tf);
            if pe=nil then break;
            petr:=translist.Find(pe.MsgId);
            if petr<>nil then begin
              pe.MsgStr:=petr.MsgStr;
              pe.UserCommentList.Text:=petr.UserCommentList.Text;
            end;
            pe.WriteToStream(fs);
          end;
        finally
          FreeAndNil (fs);
        end;
      finally
        FreeAndNil (parser);
      end;
    finally
      CloseFile (tf);
    end;
  finally
    FreeAndNil (translist);
  end;
end;

end.

