unit gnugettext;
(**************************************************************)
(*                                                            *)
(*  (C) Copyright by Lars B. Dybdahl and others               *)
(*  E-mail: Lars@dybdahl.dk, phone +45 70201241               *)
(*                                                            *)
(*  Contributors: Peter Thornqvist, Troy Wolbrink,            *)
(*                Frank Andreas de Groot, Igor Siticov,       *)
(*                Jacques Garcia Vazquez                      *)
(*                                                            *)
(*  See http://dybdahl.dk/dxgettext/ for more information     *)
(*                                                            *)
(**************************************************************)

// Information about this file:
// $LastChangedDate: 2005-04-02 19:20:54 +0200 (Sat, 02 Apr 2005) $
// $LastChangedRevision: 45 $
// $HeadURL: svn+ssh://dybdahl@svn.berlios.de/svnroot/repos/dxgettext/trunk/dxgettext/sample/gnugettext.pas $

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// The names of any contributor may not be used to endorse or promote
// products derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

interface

// If the conditional define DXGETTEXTDEBUG is defined, debugging log is activated.
// Use DefaultInstance.DebugLogToFile() to write the log to a file.
{ $define DXGETTEXTDEBUG}

uses
  Classes, SysUtils, TypInfo;

(*****************************************************************************)
(*                                                                           *)
(*  MAIN API                                                                 *)
(*                                                                           *)
(*****************************************************************************)

// Main GNU gettext functions. See documentation for instructions on how to use them.
function _(const szMsgId: string): string;
function gettext(const szMsgId: string): string;
function dgettext(const szDomain: string; const szMsgId: string): string;
function dngettext(const szDomain: string; const singular,plural: string; Number:longint): string;
function ngettext(const singular,plural: string; Number:longint): string;
procedure textdomain(const szDomain: string);
function getcurrenttextdomain: string;
procedure bindtextdomain(const szDomain: string; const szDirectory: string);

// Set language to use
procedure UseLanguage(LanguageCode: string);
function GetCurrentLanguage:string;

// This returns an empty string if not translated or translator name is not specified.
function GetTranslatorNameAndEmail:string;


(*****************************************************************************)
(*                                                                           *)
(*  ADVANCED FUNCTIONALITY                                                   *)
(*                                                                           *)
(*****************************************************************************)

const
  DefaultTextDomain = 'default';

var
  ExecutableFilename:string;    // This is set to paramstr(0) or the name of the DLL you are creating.

const
  PreferExternal=false;       // Set to true, to prefer external *.mo over embedded translation

type
  EGnuGettext=class(Exception);
  EGGProgrammingError=class(EGnuGettext);
  EGGComponentError=class(EGnuGettext);
  EGGIOError=class(EGnuGettext);
  EGGAnsi2WideConvError=class(EGnuGettext);


(*****************************************************************************)
(*                                                                           *)
(*  CLASS based implementation.                                              *)
(*  Use TGnuGettextInstance to have more than one language                   *)
(*  in your application at the same time                                     *)
(*                                                                           *)
(*****************************************************************************)

type
  TOnDebugLine = Procedure (Sender: TObject; const Line: String; var Discard: Boolean) of Object;  // Set Discard to false if output should still go to ordinary debug log
  TGetPluralForm=function (Number:Longint):Integer;
  TDebugLogger=procedure (line: string) of object;
  TMoFile= // Don't use this class. It's for internal use.
    class // Threadsafe. Only constructor and destructor are writing to memory
    private
      doswap: boolean;
    public
      Users:Integer; // Reference count. If it reaches zero, this object should be destroyed.
      constructor Create (filename:string;Offset,Size:int64);
      destructor Destroy; override;
      function gettext(const msgid: string;var found:boolean): string; // uses mo file
      property isSwappedArchitecture:boolean read doswap;
    private
      N, O, T: Cardinal; // Values defined at http://www.linuxselfhelp.com/gnu/gettext/html_chapter/gettext_6.html
      startindex,startstep:integer;
      function autoswap32(i: cardinal): cardinal;
      function CardinalInMem(baseptr: integer; Offset: Cardinal): Cardinal;
    end;
  TDomain= // Don't use this class. It's for internal use.
    class
    private
      Enabled:boolean;
      vDirectory: string;
      procedure setDirectory(const dir: string);
    public
      DebugLogger:TDebugLogger;
      Domain: string;
      property Directory: string read vDirectory write setDirectory;
      constructor Create;
      destructor Destroy; override;
      // Set parameters
      procedure SetLanguageCode (const langcode:string);
      procedure SetFilename (const filename:string); // Bind this domain to a specific file
      // Get information
      procedure GetListOfLanguages(list:TStrings);
      function GetTranslationProperty(Propertyname: string): string;
      function gettext(const msgid: string): string; // uses mo file
    private
      mofile:TMoFile;
      SpecificFilename:string;
      curlang: string;
      OpenHasFailedBefore: boolean;
      procedure OpenMoFile;
      procedure CloseMoFile;
    end;
  TExecutable=
    class
      procedure Execute; virtual; abstract;
    end;
  TGnuGettextInstance=
    class
    private
      fOnDebugLine:TOnDebugLine;
      CreatorThread:Cardinal;  // Only this thread can use LoadResString
    public
      Enabled:Boolean;      // Set this to false to disable translations
      DesignTimeCodePage:Integer;  // See MultiByteToWideChar() in Win32 API for documentation
      constructor Create;
      destructor Destroy; override;
      procedure UseLanguage(LanguageCode: string);
      procedure GetListOfLanguages (const domain:string; list:TStrings); // Puts list of language codes, for which there are translations in the specified domain, into list
      function gettext(const szMsgId: string): string; virtual;
      function ngettext(const singular,plural:string;Number:longint):string; virtual;
      function GetCurrentLanguage:string;
      function GetTranslationProperty (const Propertyname:string):string;
      function GetTranslatorNameAndEmail:string;

      // Multi-domain functions
      function dgettext(const szDomain: string; const szMsgId: string): string; overload; virtual;
      function dngettext(const szDomain: string; const singular,plural:string;Number:longint):string; overload; virtual;
      procedure textdomain(const szDomain: string);
      function getcurrenttextdomain: string;
      procedure bindtextdomain(const szDomain: string; const szDirectory: string);
      procedure bindtextdomainToFile (const szDomain: string; const filename: string); // Also works with files embedded in exe file

      // Output all log info to this file. This may only be called once.
      procedure DebugLogToFile (const filename:string; append:boolean=false);
      procedure DebugLogPause (PauseEnabled:boolean);
      property  OnDebugLine: TOnDebugLine read fOnDebugLine write fOnDebugLine; // If set, all debug output goes here
    protected
      // Override these three, if you want to inherited from this class
      // to create a new class that handles other domain and language dependent
      // issues
      procedure WhenNewLanguage (const LanguageID:string); virtual;         // Override to know when language changes
      procedure WhenNewDomain (const TextDomain:string); virtual; // Override to know when text domain changes. Directory is purely informational
      procedure WhenNewDomainDirectory (const TextDomain,Directory:string); virtual; // Override to know when any text domain's directory changes. It won't be called if a domain is fixed to a specific file.
    private
      curlang: string;
      curGetPluralForm:TGetPluralForm;
      curmsgdomain: string;
      savefileCS: TMultiReadExclusiveWriteSynchronizer;
      savefile: TextFile;
      savememory: TStringList;
      DefaultDomainDirectory:string;
      domainlist: TStringList;     // List of domain names. Objects are TDomain.
      DebugLogCS:TMultiReadExclusiveWriteSynchronizer;
      DebugLog:TStream;
      DebugLogOutputPaused:Boolean;
      procedure DebugWriteln(line: string);
      function Getdomain(const domain, DefaultDomainDirectory, CurLang: string): TDomain;  // Translates a single property of an object
    end;

var
  DefaultInstance:TGnuGettextInstance;

implementation

(**************************************************************************)
// Some comments on the implementation:
// This unit should be independent of other units where possible.
// It should have a small footprint in any way.
(**************************************************************************)
// TMultiReadExclusiveWriteSynchronizer is used instead of TCriticalSection
// because it makes this unit independent of the SyncObjs unit
(**************************************************************************)

type
  TEmbeddedFileInfo=
    class
      offset,size:int64;
    end;
  TFileLocator=
    class // This class finds files even when embedded inside executable
      constructor Create;
      destructor Destroy; override;
      procedure Analyze;  // List files embedded inside executable
      function FileExists (filename:string):boolean;
      function GetMoFile (filename:string;DebugLogger:TDebugLogger):TMoFile;
      procedure ReleaseMoFile (mofile:TMoFile);
    private
      basedirectory:string;
      filelist:TStringList; //Objects are TEmbeddedFileInfo. Filenames are relative to .exe file
      MoFilesCS:TMultiReadExclusiveWriteSynchronizer;
      MoFiles:TStringList; // Objects are filenames+offset, objects are TMoFile
      function ReadInt64 (str:TStream):int64;
    end;
  TRStrinfo = record
    strlength, stroffset: cardinal;
  end;
  TStrInfoArr = array[0..10000000] of TRStrinfo;
  PStrInfoArr = ^TStrInfoArr;
  TCharArray5=array[0..4] of ansichar;

var
  // Information about files embedded inside .exe file
  FileLocator:TFileLocator;

function StripCR (s:string):string;
var
  i:integer;
begin
  i:=1;
  while i<=length(s) do begin
    if s[i]=#13 then delete (s,i,1) else inc (i);
  end;
  Result:=s;
end;

function LF2LineBreakA (s:string):string;
var
  i:integer;
begin
  Assert (sLinebreak=#13#10);
  i:=1;
  while i<=length(s) do begin
    if (s[i]=#10) and (copy(s,i-1,1)<>#13) then begin
      insert (#13,s,i);
      inc (i,2);
    end else
      inc (i);
  end;
  Result:=s;
end;

function string2csyntax(s: string): string;
// Converts a string to the syntax that is used in .po files
var
  i: integer;
  c: char;
begin
  Result := '';
  for i := 1 to length(s) do begin
    c := s[i];
    case c of
      #32..#33, #35..#255: Result := Result + c;
      #13: Result := Result + '\r';
      #10: Result := Result + '\n"'#13#10'"';
      #34: Result := Result + '\"';
    else
      Result := Result + '\0x' + IntToHex(ord(c), 2);
    end;
  end;
  Result := '"' + Result + '"';
end;

function gettext(const szMsgId: string): string;
begin
  Result:=DefaultInstance.gettext(szMsgId);
end;

function _(const szMsgId: string): string;
begin
  Result:=DefaultInstance.gettext(szMsgId);
end;

function dgettext(const szDomain: string; const szMsgId: string): string;
begin
  Result:=DefaultInstance.dgettext(szDomain, szMsgId);
end;

function dngettext(const szDomain: string; const singular,plural: string; Number:longint): string;
begin
  Result:=DefaultInstance.dngettext(szDomain,singular,plural,Number);
end;

function ngettext(const singular,plural: string; Number:longint): string;
begin
  Result:=DefaultInstance.ngettext(singular,plural,Number);
end;

procedure textdomain(const szDomain: string);
begin
  DefaultInstance.textdomain(szDomain);
end;

procedure SetGettextEnabled (enabled:boolean);
begin
  DefaultInstance.Enabled:=enabled;
end;

function getcurrenttextdomain: string;
begin
  Result:=DefaultInstance.getcurrenttextdomain;
end;

procedure bindtextdomain(const szDomain: string; const szDirectory: string);
begin
  DefaultInstance.bindtextdomain(szDomain, szDirectory);
end;

function GetWindowsLanguage: string;
var
  langid: Cardinal;
  langcode: string;
  CountryName: array[0..4] of char;
  LanguageName: array[0..4] of char;
  works: boolean;
begin
  // The return value of GetLocaleInfo is compared with 3 = 2 characters and a zero
  works := 3 = GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SISO639LANGNAME, LanguageName, SizeOf(LanguageName));
  works := works and (3 = GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SISO3166CTRYNAME, CountryName,
    SizeOf(CountryName)));
  if works then begin
    // Windows 98, Me, NT4, 2000, XP and newer
    LangCode := PChar(@LanguageName[0]);
    if lowercase(LangCode)='no' then LangCode:='nb';
    LangCode:=LangCode + '_' + PChar(@CountryName[0]);
  end else begin
    MessageBox('Could not retrieve locale info. This should not be possible on a normal platform.');
    langcode := 'C';
  end;
  Result := langcode;
end;

function GetTranslatorNameAndEmail:string;
begin
  Result:=DefaultInstance.GetTranslatorNameAndEmail;
end;

procedure UseLanguage(LanguageCode: string);
begin
  DefaultInstance.UseLanguage(LanguageCode);
end;

function GetCurrentLanguage:string;
begin
  Result:=DefaultInstance.GetCurrentLanguage;
end;

{ TDomain }

procedure TDomain.CloseMoFile;
begin
  if mofile<>nil then begin
    FileLocator.ReleaseMoFile(mofile);
    mofile:=nil;
  end;
  OpenHasFailedBefore:=False;
end;

destructor TDomain.Destroy;
begin
  CloseMoFile;
  inherited;
end;

function GetLastWinError:string;
var
  errcode:Cardinal;
begin
  SetLength (Result,2000);
  errcode:=GetLastError();
  Windows.FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM,nil,errcode,0,PChar(Result),2000,nil);
  Result:=StrPas(PChar(Result));
end;

procedure TDomain.OpenMoFile;
var
  filename: string;
begin
  // Check if it is already open
  if mofile<>nil then
    exit;

  // Check if it has been attempted to open the file before
  if OpenHasFailedBefore then
    exit;

  if SpecificFilename<>'' then
    filename:=SpecificFilename
  else begin
    filename := Directory + curlang + PathDelim + 'LC_MESSAGES' + PathDelim + domain + '.mo';
    if (not FileLocator.FileExists(filename)) and (not fileexists(filename)) then
      filename := Directory + copy(curlang, 1, 2) + PathDelim + 'LC_MESSAGES' + PathDelim + domain + '.mo';
  end;
  if (not FileLocator.FileExists(filename)) and (not fileexists(filename)) then begin
    OpenHasFailedBefore:=True;
    exit;
  end;
  mofile:=FileLocator.GetMoFile(filename, DebugLogger);

  {$ifdef DXGETTEXTDEBUG}
  if mofile.isSwappedArchitecture then
    DebugLogger ('.mo file is swapped (comes from another CPU architecture)');
  {$endif}

  // Check, that the contents of the file is utf-8
  if pos('CHARSET=UTF-8',uppercase(GetTranslationProperty('Content-Type')))=0 then begin
    CloseMoFile;
    {$ifdef DXGETTEXTDEBUG}
    DebugLogger ('The translation for the language code '+curlang+' (in '+filename+') does not have charset=utf-8 in its Content-Type. Translations are turned off.');
    {$endif}
    MessageBox(0,PChar('The translation for the language code '+curlang+' (in '+filename+') does not have charset=utf-8 in its Content-Type. Translations are turned off.'),'Localization problem',MB_OK);
    Enabled:=False;
  end;
end;

function TDomain.GetTranslationProperty(
  Propertyname: string): string;
var
  sl:TStringList;
  i:integer;
  s:string;
begin
  Propertyname:=uppercase(Propertyname)+': ';
  sl:=TStringList.Create;
  try
    sl.Text:=gettext('');  // Everything is UTF-8
    for i:=0 to sl.Count-1 do begin
      s:=sl.Strings[i];
      if uppercase(copy(s,1,length(Propertyname)))=Propertyname then begin
        Result:=utf8decode(trim(copy(s,length(PropertyName)+1,maxint)));
        {$ifdef DXGETTEXTDEBUG}
        DebugLogger ('GetTranslationProperty('+PropertyName+') returns '''+Result+'''.');
        {$endif}
        exit;
      end;
    end;
  finally
    FreeAndNil (sl);
  end;
  Result:='';
  {$ifdef DXGETTEXTDEBUG}
  DebugLogger ('GetTranslationProperty('+PropertyName+') did not find any value. An empty string is returned.');
  {$endif}
end;

procedure TDomain.setDirectory(const dir: string);
begin
  vDirectory := IncludeTrailingPathDelimiter(dir);
  SpecificFilename:='';
  CloseMoFile;
end;

procedure TDomain.SetLanguageCode(const langcode: string);
begin
  CloseMoFile;
  curlang:=langcode;
end;

function GetPluralForm2EN(Number: Integer): Integer;
begin
  Number:=abs(Number);
  if Number=1 then Result:=0 else Result:=1;
end;

function GetPluralForm1(Number: Integer): Integer;
begin
  Result:=0;
end;

function GetPluralForm2FR(Number: Integer): Integer;
begin
  Number:=abs(Number);
  if (Number=1) or (Number=0) then Result:=0 else Result:=1;
end;

function GetPluralForm3LV(Number: Integer): Integer;
begin
  Number:=abs(Number);
  if (Number mod 10=1) and (Number mod 100<>11) then
    Result:=0
  else
    if Number<>0 then Result:=1
                 else Result:=2;
end;

function GetPluralForm3GA(Number: Integer): Integer;
begin
  Number:=abs(Number);
  if Number=1 then Result:=0
  else if Number=2 then Result:=1
  else Result:=2;
end;

function GetPluralForm3LT(Number: Integer): Integer;
var
  n1,n2:byte;
begin
  Number:=abs(Number);
  n1:=Number mod 10;
  n2:=Number mod 100;
  if (n1=1) and (n2<>11) then
    Result:=0
  else
    if (n1>=2) and ((n2<10) or (n2>=20)) then Result:=1
    else Result:=2;
end;

function GetPluralForm3PL(Number: Integer): Integer;
var
  n1,n2:byte;
begin
  Number:=abs(Number);
  n1:=Number mod 10;
  n2:=Number mod 100;
  if n1=1 then Result:=0
  else if (n1>=2) and (n1<=4) and ((n2<10) or (n2>=20)) then Result:=1
  else Result:=2;
end;

function GetPluralForm3RU(Number: Integer): Integer;
var
  n1,n2:byte;
begin
  Number:=abs(Number);
  n1:=Number mod 10;
  n2:=Number mod 100;
  if (n1=1) and (n2<>11) then
    Result:=0
  else
    if (n1>=2) and (n1<=4) and ((n2<10) or (n2>=20)) then Result:=1
    else Result:=2;
end;

function GetPluralForm4SL(Number: Integer): Integer;
var
  n2:byte;
begin
  Number:=abs(Number);
  n2:=Number mod 100;
  if n2=1 then Result:=0
  else
  if n2=2 then Result:=1
  else
  if (n2=3) or (n2=4) then Result:=2
  else
    Result:=3;
end;

procedure TDomain.GetListOfLanguages(list: TStrings);
var
  sr:TSearchRec;
  more:boolean;
  filename, path, langcode:string;
  i, j:integer;
begin
  list.Clear;

  // Iterate through filesystem
  more:=FindFirst (Directory+'*',faAnyFile,sr)=0;
  try
    while more do begin
      if (sr.Attr and faDirectory<>0) and (sr.name<>'.') and (sr.name<>'..') then begin
        filename := Directory + sr.Name + PathDelim + 'LC_MESSAGES' + PathDelim + domain + '.mo';
        if fileexists(filename) then begin
          langcode:=lowercase(sr.name);
          if list.IndexOf(langcode)=-1 then
            list.Add(langcode);
        end;
      end;
      more:=FindNext (sr)=0;
    end;
  finally
    FindClose (sr);
  end;

  // Iterate through embedded files
  for i:=0 to FileLocator.filelist.Count-1 do begin
    filename:=FileLocator.basedirectory+FileLocator.filelist.Strings[i];
    path:=Directory;
    path:=uppercase(path);
    filename:=uppercase(filename);
    j:=length(path);
    if copy(filename,1,j)=path then begin
      path:=PathDelim + 'LC_MESSAGES' + PathDelim + domain + '.mo';
      path:=uppercase(path);
      if copy(filename,length(filename)-length(path)+1,length(path))=path then begin
        langcode:=lowercase(copy(filename,j+1,length(filename)-length(path)-j));
        if list.IndexOf(langcode)=-1 then
          list.Add(langcode);
      end;
    end;
  end;
end;

procedure TDomain.SetFilename(const filename: string);
begin
  CloseMoFile;
  vDirectory := '';
  SpecificFilename:=filename;
end;

function TDomain.gettext(const msgid: string): string;
var
  found:boolean;
begin
  if not Enabled then begin
    Result:=msgid;
    exit;
  end;
  if (mofile=nil) and (not OpenHasFailedBefore) then
    OpenMoFile;
  if mofile=nil then begin
    {$ifdef DXGETTEXTDEBUG}
    DebugLogger('.mo file is not open. Not translating "'+msgid+'"');
    {$endif}
    Result := msgid;
  end else begin
    Result:=mofile.gettext(msgid,found);
    {$ifdef DXGETTEXTDEBUG}
    if found then
      DebugLogger ('Found in .mo ('+Domain+'): "'+utf8encode(msgid)+'"->"'+utf8encode(Result)+'"')
    else
      DebugLogger ('Translation not found in .mo file ('+Domain+') : "'+utf8encode(msgid)+'"');
    {$endif}
  end;
end;

constructor TDomain.Create;
begin
  inherited Create;
  Enabled:=True;
end;

{ TGnuGettextInstance }

procedure TGnuGettextInstance.bindtextdomain(const szDomain,
  szDirectory: string);
var
  dir:string;
begin
  dir:=IncludeTrailingPathDelimiter(szDirectory);
  {$ifdef DXGETTEXTDEBUG}
  DebugWriteln ('Text domain "'+szDomain+'" is now located at "'+dir+'"');
  {$endif}
  getdomain(szDomain,DefaultDomainDirectory,CurLang).Directory := dir;
  WhenNewDomainDirectory (szDomain, szDirectory);
end;

constructor TGnuGettextInstance.Create;
begin
  CreatorThread:=GetCurrentThreadId;
  DesignTimeCodePage:=CP_ACP;
  {$ifdef DXGETTEXTDEBUG}
  DebugLogCS:=TMultiReadExclusiveWriteSynchronizer.Create;
  DebugLog:=TMemoryStream.Create;
  DebugWriteln('Debug log started '+DateTimeToStr(Now));
  DebugWriteln('');
  {$endif}
  curGetPluralForm:=GetPluralForm2EN;
  Enabled:=True;
  curmsgdomain:=DefaultTextDomain;
  savefileCS := TMultiReadExclusiveWriteSynchronizer.Create;
  domainlist := TStringList.Create;
  TP_IgnoreList:=TStringList.Create;
  TP_IgnoreList.Sorted:=True;
  TP_GlobalClassHandling:=TList.Create;
  TP_ClassHandling:=TList.Create;

  // Set some settings
  DefaultDomainDirectory := IncludeTrailingPathDelimiter(extractfilepath(ExecutableFilename))+'locale';

  UseLanguage('');

  bindtextdomain(DefaultTextDomain, DefaultDomainDirectory);
  textdomain(DefaultTextDomain);

  // Add default properties to ignore
  TP_GlobalIgnoreClassProperty(TComponent,'Name');
  TP_GlobalIgnoreClassProperty(TCollection,'PropName');
end;

destructor TGnuGettextInstance.Destroy;
begin
  if savememory <> nil then begin
    savefileCS.BeginWrite;
    try
      CloseFile(savefile);
    finally
      savefileCS.EndWrite;
    end;
    FreeAndNil(savememory);
  end;
  FreeAndNil (savefileCS);
  FreeAndNil (TP_IgnoreList);
  while TP_GlobalClassHandling.Count<>0 do begin
    TObject(TP_GlobalClassHandling.Items[0]).Free;
    TP_GlobalClassHandling.Delete(0);
  end;
  FreeAndNil (TP_GlobalClassHandling);
  FreeTP_ClassHandlingItems;
  FreeAndNil (TP_ClassHandling);
  while domainlist.Count <> 0 do begin
    domainlist.Objects[0].Free;
    domainlist.Delete(0);
  end;
  FreeAndNil(domainlist);
  {$ifdef DXGETTEXTDEBUG}
  FreeAndNil (DebugLog);
  FreeAndNil (DebugLogCS);
  {$endif}
  inherited;
end;

function TGnuGettextInstance.dgettext(const szDomain: string;
  const szMsgId: string): string;
begin
  if not Enabled then begin
    {$ifdef DXGETTEXTDEBUG}
    DebugWriteln ('Translation has been disabled. Text is not being translated: '+szMsgid);
    {$endif}
    Result:=szMsgId;
  end else begin
    Result:=UTF8Decode(LF2LineBreakA(getdomain(szDomain,DefaultDomainDirectory,CurLang).gettext(StripCR(utf8encode(szMsgId)))));
    {$ifdef DXGETTEXTDEBUG}
    if (szMsgId<>'') and (Result='') then
      DebugWriteln (Format('Error: Translation of %s was an empty string. This may never occur.',[szMsgId]));
    {$endif}
  end;
end;

function TGnuGettextInstance.GetCurrentLanguage: string;
begin
  Result:=curlang;
end;

function TGnuGettextInstance.getcurrenttextdomain: string;
begin
  Result := curmsgdomain;
end;

function TGnuGettextInstance.gettext(
  const szMsgId: string): string;
begin
  Result := dgettext(curmsgdomain, szMsgId);
end;

procedure TGnuGettextInstance.textdomain(const szDomain: string);
begin
  {$ifdef DXGETTEXTDEBUG}
  DebugWriteln ('Changed text domain to "'+szDomain+'"');
  {$endif}
  curmsgdomain := szDomain;
  WhenNewDomain (szDomain);
end;

procedure TGnuGettextInstance.UseLanguage(LanguageCode: string);
var
  i,p:integer;
  dom:TDomain;
  l2:string[2];
begin
  {$ifdef DXGETTEXTDEBUG}
  DebugWriteln('UseLanguage('''+LanguageCode+'''); called');
  {$endif}

  if LanguageCode='' then begin
    LanguageCode:=GetEnvironmentVariable('LANG');
    {$ifdef DXGETTEXTDEBUG}
    DebugWriteln ('LANG env variable is '''+LanguageCode+'''.');
    {$endif}
    if LanguageCode='' then begin
      LanguageCode:=GetWindowsLanguage;
      {$ifdef DXGETTEXTDEBUG}
      DebugWriteln ('Found Windows language code to be '''+LanguageCode+'''.');
      {$endif}
    end;
    p:=pos('.',LanguageCode);
    if p<>0 then
      LanguageCode:=copy(LanguageCode,1,p-1);
    {$ifdef DXGETTEXTDEBUG}
    DebugWriteln ('Language code that will be set is '''+LanguageCode+'''.');
    {$endif}
  end;

  curlang := LanguageCode;
  for i:=0 to domainlist.Count-1 do begin
    dom:=domainlist.Objects[i] as TDomain;
    dom.SetLanguageCode (curlang);
  end;

  l2:=lowercase(copy(curlang,1,2));
  if (l2='en') or (l2='de') then curGetPluralForm:=GetPluralForm2EN else
  if (l2='hu') or (l2='ko') or (l2='zh') or (l2='ja') or (l2='tr') then curGetPluralForm:=GetPluralForm1 else
  if (l2='fr') or (l2='fa') or (lowercase(curlang)='pt_br') then curGetPluralForm:=GetPluralForm2FR else
  if (l2='lv') then curGetPluralForm:=GetPluralForm3LV else
  if (l2='ga') then curGetPluralForm:=GetPluralForm3GA else
  if (l2='lt') then curGetPluralForm:=GetPluralForm3LT else
  if (l2='ru') or (l2='cs') or (l2='sk') or (l2='uk') or (l2='hr') then curGetPluralForm:=GetPluralForm3RU else
  if (l2='pl') then curGetPluralForm:=GetPluralForm3PL else
  if (l2='sl') then curGetPluralForm:=GetPluralForm4SL else begin
    curGetPluralForm:=GetPluralForm2EN;
    {$ifdef DXGETTEXTDEBUG}
    DebugWriteln ('Plural form for the language was not found. English plurality system assumed.');
    {$endif}
  end;

  WhenNewLanguage (curlang);

  {$ifdef DXGETTEXTDEBUG}
  DebugWriteln('');
  {$endif}
end;

function TGnuGettextInstance.GetTranslatorNameAndEmail: string;
begin
  Result:=GetTranslationProperty('LAST-TRANSLATOR');
end;

function TGnuGettextInstance.GetTranslationProperty(
  const Propertyname: string): string;
begin
  Result:=getdomain(curmsgdomain,DefaultDomainDirectory,CurLang).GetTranslationProperty (Propertyname);
end;

function TGnuGettextInstance.dngettext(const szDomain: string; const singular, plural: string;
  Number: Integer): string;
var
  org,trans:string;
  idx:integer;
  p:integer;
begin
  {$ifdef DXGETTEXTDEBUG}
  DebugWriteln ('dngettext translation (domain '+szDomain+', number is '+IntTostr(Number)+') of '+singular+'/'+plural);
  {$endif}
  org:=singular+#0+plural;
  trans:=dgettext(szDomain,org);
  if org=trans then begin
    {$ifdef DXGETTEXTDEBUG}
    DebugWriteln ('Translation was equal to english version. English plural forms assumed.');
    {$endif}
    idx:=GetPluralForm2EN(Number)
  end else
    idx:=curGetPluralForm(Number);
  {$ifdef DXGETTEXTDEBUG}
  DebugWriteln ('Index '+IntToStr(idx)+' will be used');
  {$endif}
  while true do begin
    p:=pos(#0,trans);
    if p=0 then begin
      {$ifdef DXGETTEXTDEBUG}
      DebugWriteln ('Last translation used: '+utf8encode(trans));
      {$endif}
      Result:=trans;
      exit;
    end;
    if idx=0 then begin
      {$ifdef DXGETTEXTDEBUG}
      DebugWriteln ('Translation found: '+utf8encode(trans));
      {$endif}
      Result:=copy(trans,1,p-1);
      exit;
    end;
    delete (trans,1,p);
    dec (idx);
  end;
end;

function TGnuGettextInstance.ngettext(const singular, plural: string;
  Number: Integer): string;
begin
  Result := dngettext(curmsgdomain, singular, plural, Number);
end;

procedure TGnuGettextInstance.WhenNewDomain(const TextDomain: string);
begin
  // This is meant to be empty.
end;

procedure TGnuGettextInstance.WhenNewLanguage(const LanguageID: string);
begin
  // This is meant to be empty.
end;

procedure TGnuGettextInstance.WhenNewDomainDirectory(const TextDomain,
  Directory: string);
begin
  // This is meant to be empty.
end;

procedure TGnuGettextInstance.GetListOfLanguages(const domain: string;
  list: TStrings);
begin
  getdomain(Domain,DefaultDomainDirectory,CurLang).GetListOfLanguages(list);
end;

procedure TGnuGettextInstance.bindtextdomainToFile(const szDomain,
  filename: string);
begin
  {$ifdef DXGETTEXTDEBUG}
  DebugWriteln ('Text domain "'+szDomain+'" is now bound to file named "'+filename+'"');
  {$endif}
  getdomain(szDomain,DefaultDomainDirectory,CurLang).SetFilename (filename);
end;

procedure TGnuGettextInstance.DebugLogPause(PauseEnabled: boolean);
begin
  DebugLogOutputPaused:=PauseEnabled;
end;

procedure TGnuGettextInstance.DebugLogToFile(const filename: string; append:boolean=false);
{$ifdef DXGETTEXTDEBUG}
var
  fs:TFileStream;
  marker:string;
{$endif}
begin
  {$ifdef DXGETTEXTDEBUG}
  // Create the file if needed
  if (not fileexists(filename)) or (not append) then
    fileclose (filecreate (filename));

  // Open file
  fs:=TFileStream.Create (filename,fmOpenWrite or fmShareDenyWrite);
  if append then
    fs.Seek(0,soFromEnd);

  // Write header if appending
  if fs.Position<>0 then begin
    marker:=sLineBreak+'==========================================================================='+sLineBreak;
    fs.WriteBuffer(marker[1],length(marker));
  end;

  // Copy the memorystream contents to the file
  DebugLog.Seek(0,soFromBeginning);
  fs.CopyFrom(DebugLog,0);

  // Make DebugLog point to the filestream
  FreeAndNil (DebugLog);
  DebugLog:=fs;
{$endif}
end;

procedure TGnuGettextInstance.DebugWriteln(line: string);
Var
  Discard: Boolean;
begin
  Assert (DebugLogCS<>nil);
  Assert (DebugLog<>nil);

  DebugLogCS.BeginWrite;
  try
    if DebugLogOutputPaused then
      exit;

    if Assigned (fOnDebugLine) then begin
      Discard := True;
      fOnDebugLine (Self, Line, Discard);
      If Discard then Exit;
    end;

    line:=line+sLineBreak;

    // Ensure that memory usage doesn't get too big.
    if (DebugLog is TMemoryStream) and (DebugLog.Position>1000000) then begin
      line:=sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
            'Debug log halted because memory usage grew too much.'+sLineBreak+
            'Specify a filename to store the debug log in or disable debug loggin in gnugettext.pas.'+
            sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak;
      DebugLogOutputPaused:=True;
    end;
    DebugLog.WriteBuffer(line[1],length(line));
  finally
    DebugLogCS.EndWrite;
  end;
end;

function TGnuGettextInstance.Getdomain(const domain, DefaultDomainDirectory, CurLang: string): TDomain;
// Retrieves the TDomain object for the specified domain.
// Creates one, if none there, yet.
var
  idx: integer;
begin
  idx := domainlist.IndexOf(Domain);
  if idx = -1 then begin
    Result := TDomain.Create;
    Result.DebugLogger:=DebugWriteln;
    Result.Domain := Domain;
    Result.Directory := DefaultDomainDirectory;
    Result.SetLanguageCode(curlang);
    domainlist.AddObject(Domain, Result);
  end else begin
    Result := domainlist.Objects[idx] as TDomain;
  end;
end;

{ TFileLocator }

procedure TFileLocator.Analyze;
var
  s:string;
  i:integer;
  offset:int64;
  fs:TFileStream;
  fi:TEmbeddedFileInfo;
  filename:string;
begin
  s:='6637DB2E-62E1-4A60-AC19-C23867046A89'#0#0#0#0#0#0#0#0;
  s:=copy(s,length(s)-7,8);
  offset:=0;
  for i:=8 downto 1 do
    offset:=offset shl 8+ord(s[i]);  
  if offset=0 then
    exit;
  BaseDirectory:=ExtractFilePath(ExecutableFilename);
  try
    fs:=TFileStream.Create(ExecutableFilename,fmOpenRead or fmShareDenyNone);
    try
      while true do begin
        fs.Seek(offset,soFromBeginning);
        offset:=ReadInt64(fs);
        if offset=0 then
          exit;
        fi:=TEmbeddedFileInfo.Create;
        try
          fi.Offset:=ReadInt64(fs);
          fi.Size:=ReadInt64(fs);
          SetLength (filename, offset-fs.position);
          fs.ReadBuffer (filename[1],offset-fs.position);
          filename:=trim(filename);
          if PreferExternal and sysutils.fileexists(basedirectory+filename) then begin
            // Disregard the internal version and use the external version instead
            FreeAndNil (fi);
          end else
            filelist.AddObject(filename,fi);
        except
          FreeAndNil (fi);
          raise;
        end;
      end;
    finally
      FreeAndNil (fs);
    end;
  except
    {$ifdef DXGETTEXTDEBUG}
    raise;
    {$endif}
  end;
end;

constructor TFileLocator.Create;
begin
  MoFilesCS:=TMultiReadExclusiveWriteSynchronizer.Create;
  MoFiles:=TStringList.Create;
  filelist:=TStringList.Create;
  MoFiles.Sorted:=True;
  MoFiles.Duplicates:=dupError;
  MoFiles.CaseSensitive:=False;
  filelist.Duplicates:=dupError;
  filelist.CaseSensitive:=False;
  filelist.Sorted:=True;
end;

destructor TFileLocator.Destroy;
begin
  while filelist.count<>0 do begin
    filelist.Objects[0].Free;
    filelist.Delete (0);
  end;
  FreeAndNil (filelist);
  FreeAndNil (MoFiles);
  FreeAndNil (MoFilesCS);
  inherited;
end;

function TFileLocator.FileExists(filename: string): boolean;
var
  idx:integer;
begin
  if copy(filename,1,length(basedirectory))=basedirectory then begin
    // Cut off basedirectory if the file is located beneath that base directory
    filename:=copy(filename,length(basedirectory)+1,maxint);
  end;
  Result:=filelist.Find(filename,idx);
end;

function TFileLocator.GetMoFile(filename: string; DebugLogger:TDebugLogger): TMoFile;
var
  fi:TEmbeddedFileInfo;
  idx:integer;
  idxname:string;
  Offset, Size: Int64;
  realfilename:string;
begin
  // Find real filename
  offset:=0;
  size:=0;
  realfilename:=filename;
  if copy(filename,1,length(basedirectory))=basedirectory then begin
    filename:=copy(filename,length(basedirectory)+1,maxint);
    idx:=filelist.IndexOf(filename);
    if idx<>-1 then begin
      fi:=filelist.Objects[idx] as TEmbeddedFileInfo;
      realfilename:=ExecutableFilename;
      offset:=fi.offset;
      size:=fi.size;
      {$ifdef DXGETTEXTDEBUG}
      DebugLogger ('Instead of '+filename+', using '+realfilename+' from offset '+IntTostr(offset)+', size '+IntToStr(size));
      {$endif}
    end;
  end;


  {$ifdef DXGETTEXTDEBUG}
  DebugLogger ('Reading .mo data from file '''+filename+'''');
  {$endif}

  // Find TMoFile object
  MoFilesCS.BeginWrite;
  try
    idxname:=realfilename+#0+IntToStr(offset);
    if MoFiles.Find(idxname, idx) then begin
      Result:=MoFiles.Objects[idx] as TMoFile;
    end else begin
      Result:=TMoFile.Create (realfilename, Offset, Size);
      MoFiles.AddObject(idxname, Result);
    end;
    Inc (Result.Users);
  finally
    MoFilesCS.EndWrite;
  end;
end;

function TFileLocator.ReadInt64(str: TStream): int64;
begin
  Assert (sizeof(Result)=8);
  str.ReadBuffer(Result,8);
end;

procedure TFileLocator.ReleaseMoFile(mofile: TMoFile);
var
  i:integer;
begin
  Assert (mofile<>nil);
  
  MoFilesCS.BeginWrite;
  try
    dec (mofile.Users);
    if mofile.Users<=0 then begin
      i:=MoFiles.Count-1;
      while i>=0 do begin
        if MoFiles.Objects[i]=mofile then begin
          MoFiles.Delete(i);
          FreeAndNil (mofile);
          break;
        end;
        dec (i);
      end;
    end;
  finally
    MoFilesCS.EndWrite;
  end;
end;

{ TMoFile }

function TMoFile.autoswap32(i: cardinal): cardinal;
var
  cnv1, cnv2:
    record
      case integer of
        0: (arr: array[0..3] of byte);
        1: (int: cardinal);
    end;
begin
  if doswap then begin
    cnv1.int := i;
    cnv2.arr[0] := cnv1.arr[3];
    cnv2.arr[1] := cnv1.arr[2];
    cnv2.arr[2] := cnv1.arr[1];
    cnv2.arr[3] := cnv1.arr[0];
    Result := cnv2.int;
  end else
    Result := i;
end;

function TMoFile.CardinalInMem(baseptr: PChar; Offset: Cardinal): Cardinal;
var pc:^Cardinal;
begin
  inc (baseptr,offset);
  pc:=Pointer(baseptr);
  Result:=pc^;
  if doswap then
    autoswap32(Result);
end;

constructor TMoFile.Create(filename: string; Offset,Size:int64);
var
  i:cardinal;
  nn:integer;
begin
  if sizeof(i) <> 4 then
    raise EGGProgrammingError.Create('TDomain in gnugettext is written for an architecture that has 32 bit integers.');

  // Map the mo file into memory and let the operating system decide how to cache
  mo:=createfile (PChar(filename),GENERIC_READ,FILE_SHARE_READ,nil,OPEN_EXISTING,0,0);
  if mo=INVALID_HANDLE_VALUE then
    raise EGGIOError.Create ('Cannot open file '+filename);
  momapping:=CreateFileMapping (mo, nil, PAGE_READONLY, 0, 0, nil);
  if momapping=0 then
    raise EGGIOError.Create ('Cannot create memory map on file '+filename);
  momemoryHandle:=MapViewOfFile (momapping,FILE_MAP_READ,0,0,0);
  if momemoryHandle=nil then begin
    raise EGGIOError.Create ('Cannot map file '+filename+' into memory. Reason: '+GetLastWinError);
  end;
  momemory:=momemoryHandle+offset;

  // Check the magic number
  doswap:=False;
  i:=CardinalInMem(momemory,0);
  if (i <> $950412DE) and (i <> $DE120495) then
    EGGIOError.Create('This file is not a valid GNU gettext mo file: ' + filename);
  doswap := (i = $DE120495);


  // Find the positions in the file according to the file format spec
  CardinalInMem(momemory,4);       // Read the version number, but don't use it for anything.
  N:=CardinalInMem(momemory,8);    // Get string count
  O:=CardinalInMem(momemory,12);   // Get offset of original strings
  T:=CardinalInMem(momemory,16);   // Get offset of translated strings

  // Calculate start conditions for a binary search
  nn := N;
  startindex := 1;
  while nn <> 0 do begin
    nn := nn shr 1;
    startindex := startindex shl 1;
  end;
  startindex := startindex shr 1;
  startstep := startindex shr 1;
end;

destructor TMoFile.Destroy;
begin
  UnMapViewOfFile (momemoryHandle);
  CloseHandle (momapping);
  CloseHandle (mo);
  inherited;
end;

function TMoFile.gettext(const msgid: string;var found:boolean): string;
var
  i, step: cardinal;
  offset, pos: cardinal;
  CompareResult:integer;
  msgidptr,a,b:PChar;
  abidx:integer;
  size, msgidsize:integer;
begin
  found:=false;
  msgidptr:=PChar(msgid);
  msgidsize:=length(msgid);

  // Do binary search
  i:=startindex;
  step:=startstep;
  while true do begin
    // Get string for index i
    pos:=O+8*(i-1);
    offset:=CardinalInMem (momemory,pos+4);
    size:=CardinalInMem (momemory,pos);
    a:=msgidptr;
    b:=momemory+offset;
    abidx:=size;
    if msgidsize<abidx then
      abidx:=msgidsize;
    CompareResult:=0;
    while abidx<>0 do begin
      CompareResult:=integer(byte(a^))-integer(byte(b^));
      if CompareResult<>0 then
        break;
      dec (abidx);
      inc (a);
      inc (b);
    end;
    if CompareResult=0 then 
      CompareResult:=msgidsize-size;
    if CompareResult=0 then begin  // msgid=s
      // Found the msgid
      pos:=T+8*(i-1);
      offset:=CardinalInMem (momemory,pos+4);
      size:=CardinalInMem (momemory,pos);
      SetString (Result,momemory+offset,size);
      found:=True;
      break;
    end;
    if step=0 then begin
      // Not found
      Result:=msgid;
      break;
    end;
    if CompareResult<0 then begin  // msgid<s
      if i < 1+step then
        i := 1
      else
        i := i - step;
      step := step shr 1;
    end else begin  // msgid>s
      i := i + step;
      if i > N then
        i := N;
      step := step shr 1;
    end;
  end;
end;

initialization
  {$ifdef DXGETTEXTDEBUG}
  MessageBox (0,'gnugettext.pas debugging is enabled. Turn it off before releasing this piece of software.','Information',MB_OK);
  {$endif}
  if IsLibrary then begin
    // Get DLL/shared object filename
    SetLength (ExecutableFilename,300);
    SetLength (ExecutableFilename,GetModuleFileName(FindClassHInstance(TGnuGettextInstance), PChar(ExecutableFilename), length(ExecutableFilename)));
  end else
    ExecutableFilename:=Paramstr(0);
  FileLocator:=TFileLocator.Create;
  FileLocator.Analyze;
  ResourceStringDomainList:=TStringList.Create;
  ResourceStringDomainList.Add(DefaultTextDomain);
  ResourceStringDomainListCS:=TMultiReadExclusiveWriteSynchronizer.Create;
  DefaultInstance:=TGnuGettextInstance.Create;
  Win32PlatformIsUnicode := (Win32Platform = VER_PLATFORM_WIN32_NT);

  // replace Borlands LoadResString with gettext enabled version:
  HookLoadResString:=THook.Create (@system.LoadResString, @LoadResStringA);
  HookLoadStr:=THook.Create (@sysutils.LoadStr, @SysUtilsLoadStr);
  HookFmtLoadStr:=THook.Create (@sysutils.FmtLoadStr, @SysUtilsFmtLoadStr);
  HookIntoResourceStrings (AutoCreateHooks,false);

finalization
  FreeAndNil (DefaultInstance);
  FreeAndNil (ResourceStringDomainListCS);
  FreeAndNil (ResourceStringDomainList);
  FreeAndNil (HookFmtLoadStr);
  FreeAndNil (HookLoadStr);
  FreeAndNil (HookLoadResString);
  FreeAndNil (FileLocator);

end.

