unit uRun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ExtCtrls;

type
  TFormRun = class(TForm)
    ButtonGo: TButton;
    EditTranslation: TLabeledEdit;
    EditTemplate: TLabeledEdit;
    ButtonChooseTemplate: TButton;
    XPManifest: TXPManifest;
    ButtonChooseTranslation: TButton;
    CheckBoxCreateBackup: TCheckBox;
    CheckBoxSaveSettings: TCheckBox;
    CheckBoxNonAscii: TCheckBox;
    procedure ButtonGoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ButtonChooseTranslationClick(Sender: TObject);
    procedure ButtonChooseTemplateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRun: TFormRun;

implementation

uses
  ConsoleApp, gnugettext, shellapi, IniFiles, appconsts, msgmergedxengine;

{$R *.dfm}

function shellescape (s:string):string;
var
  i:integer;
begin
  Result:='';
  for i:=1 to length(s) do begin
    if s[i]='"' then
      Result:=Result+'\"'
    else
    if s[i]='\' then
      Result:=Result+'\\'
    else
      Result:=Result+s[i];
  end;
end;

procedure TFormRun.ButtonGoClick(Sender: TObject);
var
  res:DWORD;
  AppOutput:TStringList;
  output:string;
  translation,translationbackup:string;
  template:string;
  tempfilename:string;
  ini:TIniFile;
  cmdline:string;
  msgmergedxengine:TMsgMergeDxEngine;
begin
  screen.cursor:=crHourglass;
  try
    translation:=ExpandFileName(EditTranslation.Text);
    if not fileexists(translation) then
      raise Exception.Create (_('The specified translation file does not exist.'));
    template:=ExpandFileName(EditTemplate.Text);
    if not fileexists(template) then
      raise Exception.Create (_('The specified template file does not exist.'));
    tempfilename:=ChangeFileExt(translation,'.pox');
    if CheckBoxNonAscii.Checked then begin
      // Non-ASCII support required. Use internal function.
      msgmergedxengine:=TMsgMergeDxEngine.Create;
      try
        msgmergedxengine.translationfilename:=translation;
        msgmergedxengine.templatefilename:=template;
        msgmergedxengine.outputfilename:=tempfilename;
        msgmergedxengine.Execute;
      finally
        FreeAndNil (msgmergedxengine);
      end;
    end else begin
      // ASCII only. Use external msgmerge.exe
      AppOutput:=TStringList.Create;
      try
        chdir (extractfilepath(paramstr(0)));
        cmdline:='msgmerge.exe -q "'+shellescape(translation)+'" "'+shellescape(template)+'" -o "'+shellescape(tempfilename)+'" 2>&1';
        res:=ExecConsoleApp('bash.exe','-c "'+shellescape(cmdline)+'"',AppOutput,nil);
        output:=trim(AppOutput.Text);
        if output<>'' then begin
          ShowMessage (output);
          ShowMessage (_('Because there was unexpected output from msgmerge.exe, no merging has been done.'));
          exit;
        end;
        if res<>0 then
          raise Exception.Create (Format(_('msgmerge.exe failed with exit code %s.'),[IntToStr(res)]));
      finally
        FreeAndNil (AppOutput);
      end;
    end;
    translationbackup:=changefileext(translation,'.~po');
    if Fileexists (translationbackup) then
      Deletefile (translationbackup);
    if not RenameFile(translation,translationbackup) then
      raise Exception.Create (Format(_('Cannot rename %s to %s'),[translation,translationbackup]));
    if not RenameFile(tempfilename,translation) then
      raise Exception.Create (Format(_('Cannot rename %s to %s'),[tempfilename,translation]));
    if fileexists(tempfilename) then
      deletefile (tempfilename);
    if not CheckBoxCreateBackup.Checked then
      deletefile (translationbackup);
    if MessageDlg(_('The template was merged into the translation file.'+sLineBreak+
                    'Do you want to open the translation file now?'+sLineBreak+
                    '(This requires you to have a .po file editor installed)'),mtConfirmation,[mbYes,mbNo],0)=mrYes then
      ShellExecute (Application.Handle,'open',PChar(translation),nil,nil,SW_RESTORE);
    if CheckBoxSaveSettings.Checked then begin
      ini:=TIniFile.Create (ChangeFileExt(translation,'.ini'));
      try
        ini.WriteString('ggmerge','template',template);
        ini.WriteBool('ggmerge','createbackup',CheckBoxCreateBackup.Checked);
        ini.WriteBool('ggmerge','supportnonascii',CheckBoxNonAscii.Checked);
      finally
        FreeAndNil (ini);
      end;
    end;
    Close;
  finally
    screen.cursor:=crDefault;
  end;
end;

procedure TFormRun.FormCreate(Sender: TObject);
var
  ini:TIniFile;
  inifilename:string;
begin
  if paramcount=1 then
    EditTranslation.Text:=ExpandFileName(paramstr(1));
  TranslateComponent (self);
  FormResize (self);
  inifilename:=ChangeFileExt(EditTranslation.Text,'.ini');
  CheckBoxSaveSettings.Checked:=FileExists(inifilename);
  if CheckBoxSaveSettings.Checked then begin
    ini:=TIniFile.Create (inifilename);
    try
      EditTemplate.Text:=ini.ReadString('ggmerge','template','');
      CheckBoxCreateBackup.Checked:=ini.ReadBool('ggmerge','createbackup',CheckBoxCreateBackup.Checked);
      CheckBoxNonAscii.Checked:=ini.ReadBool('ggmerge','supportnonascii',CheckBoxNonAscii.Checked);
    finally
      FreeAndNil (ini);
    end;
  end;
  Caption:=Caption+' (ggmerge '+Version+')';
end;

procedure TFormRun.FormResize(Sender: TObject);
begin
  ButtonGo.Left:=(Width-ButtonGo.Width) div 2;
end;

procedure TFormRun.ButtonChooseTranslationClick(Sender: TObject);
var
  od:TOpenDialog;
begin
  od:=TOpenDialog.Create(self);
  try
    od.FileName:=EditTranslation.Text;
    od.DefaultExt:='po';
    od.Filter:=_('Translation files (*.po)|*.po|All files (*.*)|*.*');
    od.Options:=[ofHideReadOnly,ofNoChangeDir,ofPathMustExist,ofFileMustExist,ofNoReadOnlyReturn,ofEnableSizing];
    if od.Execute then
      EditTranslation.Text:=od.FileName;
  finally
    FreeAndNil (od);
  end;
end;

procedure TFormRun.ButtonChooseTemplateClick(Sender: TObject);
var
  od:TOpenDialog;
begin
  od:=TOpenDialog.Create(self);
  try
    od.FileName:=EditTemplate.Text;
    od.DefaultExt:='po';
    od.Filter:=_('Template files (*.po;*.pot)|*.po;*.pot|All files (*.*)|*.*');
    od.Options:=[ofHideReadOnly,ofNoChangeDir,ofPathMustExist,ofFileMustExist,ofNoReadOnlyReturn,ofEnableSizing];
    if od.Execute then
      EditTemplate.Text:=od.FileName;
  finally
    FreeAndNil (od);
  end;
end;

end.

