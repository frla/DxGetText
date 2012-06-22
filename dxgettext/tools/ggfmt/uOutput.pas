unit uOutput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormOutput = class(TForm)
    MemoOutput: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOutput: TFormOutput;

implementation

uses ConsoleApp;

{$R *.dfm}

end.
