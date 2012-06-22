unit assembleengine;

interface

uses
  Classes;

type
  Tassembleengine=
    class
    public
      exefilename:string;
      patchcode:string;
      filemask:string;
      filelist:TStringList;  // Objects are TFileInfo
      constructor Create;
      destructor Destroy; override;
      procedure PrepareFileList; // Always run that before Execute;
      procedure SkipFile (filename:string); // removes item from list
      procedure Execute;
      procedure SetGnuGettextPatchCode;
    private
      basedirectory:string;
      procedure RecurseDirs (list:TStringList; dir:string);
      function FindPatchPosition(str: TFileStream): int64;
    end;

implementation

uses
  SysUtils,
  gnugettext;

type
  TFileInfo=
    class
      filename:string; // Relative, including the first directory name
      offset:int64;    // Position in .exe file where this file starts
      size:int64;
    end;

procedure StreamWrite (s:TStream;line:string);
var
  nextpos:integer;
begin
  nextpos:=length(line);
  if nextpos>0 then
    if s.Write(line[1],nextpos)<>nextpos then
      raise Exception.Create (_('Error when writing to stream.'));
end;

procedure StreamWriteInt64 (s:TStream; i:int64);
begin
  Assert (sizeof(i)=8);
  s.WriteBuffer(i,8);
end;

{ Tassembleengine }

constructor Tassembleengine.Create;
begin
  filemask:='*';
  filelist:=TStringList.Create;
end;

destructor Tassembleengine.Destroy;
begin
  while filelist.Count<>0 do begin
    filelist.Objects[0].Free;
    filelist.Delete (0);
  end;
  FreeAndNil (filelist);
  inherited;
end;

procedure Tassembleengine.Execute;
var
  str,infile:TFileStream;
  i:integer;
  nextpos:int64;
  fi:TFileInfo;
  patchposition,tableoffset:int64;
begin
  if exefilename='' then
    raise Exception.Create (_('No .exe filename specified.'));

  basedirectory:=extractfilepath(exefilename);

  // Find all files to include
  if filelist.count=0 then
    PrepareFileList;
  filelist.Sort;

  str:=TFileStream.Create (exefilename,fmOpenReadWrite);
  try
    // Find patch position
    patchposition:=FindPatchPosition (str);
    if patchposition=0 then
      raise Exception.Create (Format(_('Patch code "%s" was not found in .exe file. Are you sure the .exe file has been compiled with the correct libraries?'),[patchcode]));

    // Add files to the end of the exe file
    str.Seek(0, soFromEnd);
    for i:=0 to filelist.count-1 do begin
      fi:=filelist.objects[i] as TFileInfo;
      infile:=TFileStream.Create (basedirectory+fi.filename, fmOpenRead);
      try
        fi.offset:=str.Position;
        fi.size:=infile.Size;
        str.CopyFrom(infile,0);
      finally
        FreeAndNil (infile);
      end;
    end;

    // Write List of files
    while str.position and $ff<>0 do
      StreamWrite (str,#0);
    tableoffset:=str.Position;
    nextpos:=tableoffset;
    for i:=0 to filelist.Count-1 do begin
      while str.position<>nextpos do
        StreamWrite (str,' ');
      fi:=filelist.Objects[i] as TFileInfo;
      nextpos:=((str.Position+sizeof(nextpos)+sizeof(fi.offset)+sizeof(fi.size)+length(fi.filename))+256) and (not $ff);
      StreamWriteInt64(str,nextpos);
      StreamWriteInt64(str,fi.offset);
      StreamWriteInt64(str,fi.size);
      StreamWrite (str,fi.filename);
    end;
    while str.position<>nextpos do
      StreamWrite (str,' ');
    StreamWriteInt64(str,0);

    str.Seek(patchposition+length(patchcode),soFromBeginning);
    StreamWriteInt64(str,TableOffset);

  finally
    FreeAndNil (str);
  end;
end;

function Tassembleengine.FindPatchPosition(str: TFileStream): int64;
// Finds the position of patchcode in the file.
const
  bufsize=100000;
var
  a:string;
  b:string;
  offset:integer;
  rd,p:Integer;
begin
  if patchcode='' then
    raise Exception.Create (_('No patch code has been specified.'));
  offset:=0;
  SetLength (a, bufsize);
  SetLength (b, bufsize);
  str.Seek(0,soFromBeginning);
  str.Read(a[1],bufsize);
  while true do begin
    rd:=str.Read(b[1],bufsize);
    p:=pos(patchcode,a+b);
    if (p<>0) and (p<bufsize+100) then begin
      Result:=offset+p-1;
      if copy(a+b,p+length(patchcode),8)<>#0#0#0#0#0#0#0#0 then
        raise Exception.Create (_('This file has already been modified. Please recompile this .exe file.'));
      exit;
    end;
    if rd<>bufsize then begin
      // Prematurely ended without finding anything
      Result:=0;
      exit;
    end;
    a:=b;
    offset:=offset+bufsize;
  end;
  Result:=0;
end;

procedure Tassembleengine.PrepareFileList;
begin
  if filelist.Count=0 then
    RecurseDirs (filelist,'');
end;

procedure Tassembleengine.RecurseDirs(list: TStringList; dir: string);
var
  sr:TSearchRec;
  dirlist:TStringList;
  more:boolean;
  fi:TFileInfo;
begin
  dirlist:=TStringList.Create;
  try
    dirlist.Add(dir);

    while dirlist.Count<>0 do begin
      dir:=dirlist.Strings[0];
      dirlist.Delete (0);
      
      // Scan this directory for subdirectories
      more:=FindFirst (basedirectory+dir+'*',faAnyFile,sr)=0;
      while more do begin
        if (sr.Name<>'.') and (sr.Name<>'..') then begin
          if sr.Attr and faDirectory<>0 then begin
            dirlist.Add(dir+sr.Name+PathDelim);
          end;
        end;
        more:=Findnext (sr)=0;
      end;
      FindClose (sr);

      // Scan this directory for files
      more:=FindFirst (basedirectory+dir+filemask,faAnyFile,sr)=0;
      while more do begin
        if (sr.Name<>'.') and (sr.Name<>'..') then begin
          if sr.Attr and faDirectory=0 then begin
            if uppercase(dir+sr.Name)<>uppercase(exefilename) then begin
              fi:=TFileInfo.Create;
              fi.filename:=dir+sr.Name;
              list.AddObject (fi.filename, fi);
            end;
          end;
        end;
        more:=Findnext (sr)=0;
      end;
      FindClose (sr);
    end;
  finally
    FreeAndNil (dirlist);
  end;
end;

procedure Tassembleengine.SetGnuGettextPatchCode;
begin
  patchcode:='6637DB2E-62E1-4A60-AC19-C23867046A89';
end;

procedure Tassembleengine.SkipFile(filename: string);
var
  idx:integer;
begin
  idx:=filelist.IndexOf(filename);
  if idx=-1 then raise Exception.Create ('Internal error. Filename not found in list: '+filename);
  filelist.Objects[idx].Free;
  filelist.Delete(idx); 
end;

end.
