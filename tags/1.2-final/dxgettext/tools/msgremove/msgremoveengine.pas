unit msgremoveengine;

interface

uses
  Classes, poparser;

type
  Tmsgmkignoreengine=
    class
    public
      inputfilename:string;
      removelistfilename:string;
      outputfilename:string;
      constructor Create;
      destructor Destroy; override;
      procedure Execute;
    private
      removelist:TPoEntryList;
      procedure AddToRemoveList (po:TPoEntry);
      procedure HandleEntry (outfile:TStream;po:TPoEntry);
    end;
    
implementation

uses
  SysUtils,
  gnugettext;

{ Tmsgmkignoreengine }

procedure Tmsgmkignoreengine.AddToRemoveList(po: TPoEntry);
begin
  removelist.Add(po);
end;

constructor Tmsgmkignoreengine.Create;
begin
  removelist:=TPoEntryList.Create;
end;

destructor Tmsgmkignoreengine.Destroy;
begin
  FreeAndNil (removelist);
  inherited;
end;

procedure Tmsgmkignoreengine.Execute;
var
  infile:TextFile;
  pop:TPoParser;
  po:TPoEntry;
  outfile:TFileStream;
begin
  if inputfilename='' then
    raise Exception.Create (_('No input filename specified.'));
  if removelistfilename='' then
    raise Exception.Create (_('No filename specified for list of msgids to remove.'));
  if outputfilename='' then
    raise Exception.Create (_('No output filename specified.'));

  // Read list of po things to remove
  AssignFile (infile,removelistfilename);
  Reset (infile);
  pop:=TPoParser.Create;
  try
    while true do begin
      po:=pop.ReadNextEntry(infile);
      if po=nil then
        break;
      AddToRemoveList (po);
    end;
  finally
    FreeAndNil (pop);
    CloseFile (infile);
  end;

  // Convert the file
  AssignFile (infile,inputfilename);
  Reset (infile);
  outfile:=TFileStream.Create (outputfilename,fmCreate);
  pop:=TPoParser.Create;
  try
    while true do begin
      po:=pop.ReadNextEntry(infile);
      if po=nil then
        break;
      HandleEntry (outfile,po);
    end;
  finally
    FreeAndNil (pop);
    CloseFile (infile);
    FreeAndNil (outfile);
  end;
end;

procedure Tmsgmkignoreengine.HandleEntry(outfile: TStream; po: TPoEntry);
begin
  if (po.MsgId='') or (removelist.Find(po.MsgId)=nil) then
    po.WriteToStream(outfile);
end;

end.
